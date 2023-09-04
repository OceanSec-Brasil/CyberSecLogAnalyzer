require 'json'
require 'csv'

class LogAnalyzer
  def initialize(directory)
    @directory = directory
    @patterns = {
      sql_injection: /(\bSELECT\b|\bDROP\b|\bINSERT\b|\b--\b)/i,
      xss_attack: /(<\s*script\b)/i,
      rfi_attack: /(http|ftp)\:\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/\S*)?/i,
      user_agent_spoof: /User-Agent\: \w+/i
    }
    @report = { sql_injection: [], xss_attack: [], rfi_attack: [], user_agent_spoof: [] }
  end

  def read_logs
    Dir.foreach(@directory) do |filename|
      next if filename == '.' or filename == '..'
      File.open(File.join(@directory, filename), 'r').each_line do |line|
        analyze_line(line)
      end
    end
  end

  def analyze_line(line)
    @patterns.each do |type, pattern|
      @report[type].push(line) if line.match?(pattern)
    end
  end

  def generate_report(format = 'json')
    case format
    when 'json'
      File.open('report.json', 'w') { |file| file.write(JSON.pretty_generate(@report)) }
    when 'csv'
      CSV.open('report.csv', 'w') do |csv|
        csv << ['Type', 'Log Entry']
        @report.each do |type, entries|
          entries.each do |entry|
            csv << [type, entry]
          end
        end
      end
    else
      puts 'Unsupported format!'
    end
  end
end

if ARGV.empty?
  puts 'Usage: ruby CyberSecLogAnalyzer.rb [directory] [report_format]'
  exit
end

directory = ARGV[0]
report_format = ARGV[1] || 'json'

analyzer = LogAnalyzer.new(directory)
analyzer.read_logs
analyzer.generate_report(report_format)

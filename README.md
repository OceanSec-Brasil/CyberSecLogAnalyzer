# CyberSecLogAnalyzer

## Descrição
O CyberSecLogAnalyzer é uma ferramenta em Ruby desenvolvida para analisar arquivos de log em busca de padrões associados a diversas vulnerabilidades. O objetivo é fornecer um método rápido e fácil para identificar tentativas de ataque, como SQL Injection, Cross-Site Scripting (XSS), Remote File Inclusion (RFI), e User-Agent spoofing.

## Como Usar
1 - Clone este repositório.
2 - Coloque seus arquivos de log no diretório que você vai fornecer como argumento.
3 - Execute ```ruby CyberSecLogAnalyzer.rb [directory] [report_format]``` para iniciar a análise.
```[directory]```: Diretório onde estão os arquivos de log.
```[report_format]```: Formato do relatório ('json' ou 'csv').

## Complementos
O script foi expandido para identificar padrões adicionais, relacionados a:

- Remote File Inclusion (RFI)
- User-Agent Spoofing

## Notas
Este script é um exemplo e pode não cobrir todos os padrões de ataque. Sempre mantenha suas ferramentas de segurança atualizadas.
Este é um script para fins educativos e para auxiliar profissionais de segurança cibernética. Use-o com responsabilidade.

## Licença
MIT

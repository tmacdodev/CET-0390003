# CLAUDE.md

Este arquivo fornece orientações ao Claude Code (claude.ai/code) para trabalhar com o código deste repositório.

## O que é este repositório

`cet_aulas` é um projeto Flutter de aprendizado/aula (curso CET, aulas em português). Não é um código
de produto: cada arquivo em `lib/` é um retrato isolado de uma aula, a maioria com seu próprio `main()`
de nível superior e sem imports compartilhados entre as aulas. Os arquivos são numerados/nomeados para
acompanhar a progressão das aulas (ex.: `b01_definindo_um_ponto_de_partida.dart` →
`b08_hands_on_no_dartpad.dart`), construindo os fundamentos do Flutter (árvore de widgets → `MaterialApp`
→ `Scaffold` → `AppBar` → `FloatingActionButton` → layouts com múltiplos filhos). `caneta.dart` e
`11_hands_on_dartpad_caneta.dart` são um exercício separado sobre construtores de classes em Dart
(padrão, nomeado, posicional opcional, nomeado opcional).

Apenas `lib/main.dart` está conectado como o ponto de entrada real do app (é o que `flutter run` inicia).
Atualmente ele demonstra chamadas HTTP com `dio` (POST/PUT) contra um endpoint público de demonstração do
Firebase Realtime Database, além de interagir com a classe `Caneta` de `caneta.dart`. Os demais arquivos
de aula não são importados em nenhum lugar — para rodar um deles em vez do `main.dart`, aponte o comando
de execução diretamente para esse arquivo (veja abaixo) ou troque temporariamente o conteúdo de
`main.dart`.

## Comandos

```bash
flutter pub get                 # instala/sincroniza as dependências
flutter run                     # executa lib/main.dart em um dispositivo/emulador/navegador conectado
flutter run -t lib/b05_fornecendo_um_guia_visual_com_a_appbar.dart   # executa um arquivo de aula específico
flutter analyze                 # análise estática (usa flutter_lints via analysis_options.yaml)
flutter test                    # executa os testes (ainda não existe diretório test/ neste repositório)
```

Não há configuração de CI, nem regras de lint customizadas além das padrão de
`package:flutter_lints/flutter.yaml`, e atualmente não há suíte de testes — o `analysis_options.yaml`
exclui `build/`, `android/`, `ios/`, `web/`, `windows/`, `macos/`, `linux/` da análise.

## Notas de arquitetura

- Estrutura padrão multiplataforma do Flutter (`android/`, `ios/`, `linux/`, `macos/`, `windows/`,
  `web/` são todos runners de plataforma gerados — não edite manualmente a menos que seja para
  configuração específica de plataforma).
- Dependência externa única: `dio` para HTTP.
- Como a maioria dos arquivos em `lib/` define seu próprio `main()`, não assuma que eles se compõem em
  um único app — verifique se um arquivo é de fato importado por `main.dart` antes de tratá-lo como
  código "ativo".

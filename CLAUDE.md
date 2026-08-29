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

## Convenções de commit

Não incluir os trailers `Co-Authored-By: Claude ...` / `Claude-Session: ...` nas mensagens de commit
deste repositório — o usuário pediu para manter o histórico do GitHub sem co-autoria do Claude.

## Notas de arquitetura

- Estrutura padrão multiplataforma do Flutter (`android/`, `ios/`, `linux/`, `macos/`, `windows/`,
  `web/` são todos runners de plataforma gerados — não edite manualmente a menos que seja para
  configuração específica de plataforma).
- Dependência externa única: `dio` para HTTP.
- Como a maioria dos arquivos em `lib/` define seu próprio `main()`, não assuma que eles se compõem em
  um único app — verifique se um arquivo é de fato importado por `main.dart` antes de tratá-lo como
  código "ativo".

## Roteiro de instalação em computador novo

Passos para deixar o projeto rodando do zero em uma máquina nova.

### macOS / Linux

1. **Instalar o Flutter SDK** (inclui o Dart SDK).
   - macOS: `brew install --cask flutter` ou baixe em https://docs.flutter.dev/get-started/install.
   - Garanta que o binário `flutter` está no PATH e rode `flutter doctor` para conferir dependências
     pendentes (Xcode, Android Studio/SDK, Chrome para suporte web, etc.).
2. **Instalar o Node.js** (necessário para o Firebase CLI), caso ainda não tenha.
3. **Instalar o Firebase CLI sem sudo.** Em macOS/Linux o prefix padrão do npm
   (`/usr/local` ou similar) costuma pertencer ao `root`, e `npm install -g` sem ajuste dá
   `EACCES`. Não use `sudo npm install -g` — isso deixa arquivos com dono `root` na pasta global e
   quebra instalações futuras. Em vez disso, redirecione o prefix do npm para uma pasta sua:
   ```bash
   mkdir -p ~/.npm-global
   npm config set prefix '~/.npm-global'
   echo 'export PATH="$HOME/.npm-global/bin:$PATH"' >> ~/.zshrc   # ou ~/.bashrc
   source ~/.zshrc
   npm install -g firebase-tools
   ```
   - Confirme com `firebase --version`.
   - Alternativa: instalar o Node via `nvm` (que já usa uma pasta do usuário) ou usar o instalador
     standalone `curl -sL https://firebase.tools | bash`.
4. **Autenticar no Firebase**: `firebase login` (abre o navegador para login com a conta Google que tem
   acesso ao projeto `tm-cet-aulas`, referenciado em `.firebaserc`).
5. **Clonar o repositório**: `git clone https://github.com/tmacdodev/CET-0390003.git`.
6. **Instalar as dependências do Flutter**: dentro da pasta do projeto, rode `flutter pub get`.
7. **Verificar a análise estática**: `flutter analyze` (não deve haver erros).
8. **Rodar o app**:
   - `flutter run` executa `lib/main.dart` (ponto de entrada real, com chamadas HTTP via `dio`).
   - `flutter run -t lib/<arquivo_da_aula>.dart` executa uma aula específica isolada.
   - Se não houver dispositivo/emulador conectado, `flutter run -d chrome` funciona como alvo web.
9. **(Opcional) Testar o deploy do Firebase Hosting**: `firebase deploy --only hosting` publica o
   conteúdo de `public/` (ver `firebase.json`). Não rode isso sem confirmar com o responsável pelo
   projeto, pois afeta o ambiente hospedado real.

### Windows

1. **Instalar o Git** (necessário para clonar o repositório): https://git-scm.com/download/win.
2. **Instalar o Flutter SDK**:
   - Baixe o instalador em https://docs.flutter.dev/get-started/install/windows e extraia (ex.: em
     `C:\src\flutter`, evitando pastas com espaço ou que exijam permissão elevada, como
     `C:\Program Files`).
   - Adicione `C:\src\flutter\bin` à variável de ambiente `PATH` do usuário (Painel de Controle →
     Sistema → Configurações avançadas → Variáveis de Ambiente).
   - Abra um novo PowerShell/CMD e rode `flutter doctor` para conferir dependências pendentes
     (Android Studio/SDK, Visual Studio com "Desktop development with C++" se for compilar para
     Windows desktop, Chrome para suporte web).
3. **Instalar o Node.js**: baixe o instalador LTS em https://nodejs.org/ (já inclui o `npm` e
   configura o PATH automaticamente — não costuma haver o problema de permissão do macOS/Linux).
4. **Instalar o Firebase CLI**: em um PowerShell/CMD comum (sem "Executar como administrador"), rode:
   ```powershell
   npm install -g firebase-tools
   firebase --version
   ```
   - Alternativa: baixar o executável standalone `firebase-tools-instant-win.exe` em
     https://firebase.tools/bin/win/instant/latest, que não depende do Node/npm.
5. **Autenticar no Firebase**: `firebase login` (abre o navegador para login com a conta Google que
   tem acesso ao projeto `tm-cet-aulas`, referenciado em `.firebaserc`).
6. **Clonar o repositório**: `git clone https://github.com/tmacdodev/CET-0390003.git`.
7. **Instalar as dependências do Flutter**: dentro da pasta do projeto, rode `flutter pub get`.
8. **Verificar a análise estática**: `flutter analyze` (não deve haver erros).
9. **Rodar o app**:
   - `flutter run` executa `lib/main.dart` (ponto de entrada real, com chamadas HTTP via `dio`).
   - `flutter run -t lib/<arquivo_da_aula>.dart` executa uma aula específica isolada.
   - Se não houver dispositivo/emulador conectado, `flutter run -d chrome` funciona como alvo web.
10. **(Opcional) Testar o deploy do Firebase Hosting**: `firebase deploy --only hosting` publica o
    conteúdo de `public/` (ver `firebase.json`). Não rode isso sem confirmar com o responsável pelo
    projeto, pois afeta o ambiente hospedado real.

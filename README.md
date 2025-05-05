# 📱 ToDo App - SwiftUI

Um aplicativo minimalista de gerenciamento de tarefas desenvolvido com **SwiftUI**, inspirado na experiência nativa do iOS, com autenticação via Firebase e suporte a login com **Google** e **Apple ID**.

---

## ✨ Funcionalidades

### ✅ Tela Inicial (`HomeView`)
- Logo centralizada com imagem `main`
- Título introdutório e um texto de 4 linhas sobre o propósito do app
- Botão “Vamos começar” com a cor `#9DD4D7`
- Cor de fundo: `#EEEEEE`
- Cor da fonte: `#000000`

---

### 🔐 Tela de Login (`LoginView`)
- Título “Bem-vindo” em negrito
- Texto “Venha ver suas tarefas”
- Imagem central `login`
- Campos de:
  - E-mail
  - Senha
- Link: “Esqueceu sua senha?”
- Botões de login com:
  - Google
  - Apple ID
- Botão de login com cor `#9DD4D7`
- Link: “Não tem uma conta?” com botão `Sign Up` (cor `#9DD4D7`)

---

### 📝 Tela de Cadastro (`RegisterView`)
- Mesmo layout do login
- Campos:
  - Nome completo
  - E-mail
  - Senha
  - Confirmar senha
- Botão de registro
- Link: “Já tem uma conta?” com botão `Sign In`

---

### 📅 Tela Principal (`TodoView`)
- Imagem de perfil do usuário (posteriormente vinda do login)
- Texto: “Bem-vindo, [Nome do Usuário]”
- Topo da tela com fundo `#9DD4D7`, parte inferior com `#EEEEEE`
- Calendário estilo iOS (seleção de data)
- Texto: “Lista de tarefas”
- Div branca com todas as tarefas da data selecionada
- **Botão “Adicionar tarefa para esta data”**
  - Abre nova tela onde o usuário digita e salva a tarefa

---

## 🧱 Tecnologias

- SwiftUI
- Firebase Auth
- GoogleSignIn
- Apple SignIn (AuthServices)
- MVVM Architecture
- GitHub for version control

---

## 🚧 Status do Projeto

📌 **Em desenvolvimento.**

---

## 🧑‍💻 Autor

Desenvolvido por **Igor S. Menezes**

---

## 📸 Pré-visualização

> Adicione aqui futuramente imagens ou GIFs do funcionamento do app.

---

## 📂 Como rodar

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/seu-repo.git

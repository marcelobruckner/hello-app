# Hello App

Aplicação web simples desenvolvida em Java, utilizando o framework Spring Boot, que exibe uma mensagem de saudação.

Usada para complementar a solução de pipeline CI/CD com Openshift Pipelines (Tekton) e Openshift Gitops (ArgoCD) nos repositórios abaixo:

- [https://github.com/marcelobruckner/hello-pipeline-openshift](https://github.com/marcelobruckner/hello-pipeline-openshift)
- [https://github.com/marcelobruckner/hello-gitops-openshift](https://github.com/marcelobruckner/hello-gitops-openshift)

## 🛠️ Tecnologias Utilizadas

- **Java 17**: Linguagem de programação principal.
- **Spring Boot 3.1.2**: Framework para criação de aplicações Java.
- **Spring Web**: Módulo do Spring para desenvolvimento de aplicações web.
- **Spring Boot Actuator**: Fornece endpoints para monitoramento e gerenciamento da aplicação.
- **Spring Boot DevTools**: Ferramentas para facilitar o desenvolvimento, como recarregamento automático.
- **Maven 3.8.6**: Ferramenta de automação de compilação e gerenciamento de dependências.

## ⚙️ Pré-requisitos

- **Java 17** ou superior instalado.
- **Maven 3.8.6** ou superior instalado.

## 🚀 Como Executar

```bash
# Clone o repositório
git clone https://github.com/marcelobruckner/hello-app.git

# Acesse o diretório do projeto
cd hello-app

# Compile e execute a aplicação
mvn spring-boot:run
```

Acesse a aplicação no navegador: [http://localhost:8080](http://localhost:8080)

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests.

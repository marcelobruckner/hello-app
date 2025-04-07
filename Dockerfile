# Etapa de build usando o UBI com Java + Maven
FROM registry.access.redhat.com/ubi8/openjdk-17 AS build
USER root

# Remove diretório problemático para ambientes rootless
RUN rm -rf /var/spool/mail

# Copia os arquivos do projeto para dentro da imagem
COPY . .

# Compila o projeto
RUN mvn clean package -DskipTests


# Etapa de runtime, mais leve e segura
FROM registry.access.redhat.com/ubi8/openjdk-17-runtime

# Remove novamente o diretório problemático (caso presente na imagem final)
RUN rm -rf /var/spool/mail

# Define o diretório de trabalho
WORKDIR /deployments

# Copia o .jar gerado
COPY --from=build /home/jboss/target/hello-0.0.1-SNAPSHOT.jar hello.jar

# Garante que o .jar tenha permissões adequadas para o UID aleatório do OpenShift
RUN chmod 755 /deployments/hello.jar

# Expõe a porta da aplicação
EXPOSE 8080

# Define o ponto de entrada da aplicação
ENTRYPOINT ["java", "-jar", "hello.jar"]

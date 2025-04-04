Detalhamento da criação do projeto no Openshift com pipeline e gitops

1. Criar o projeto via CLI
   oc new-project hello

2. Criar o imageStream que vai gerar o image registry que vamos utilizar
   oc create imagestream hello

Criar o PVC

3. Vou criar o secret do github e testar na task git-clone.
   o git clone funcionou sem criar nenhum secret de github pois o repositorio e aberto

4. Criar a task buildah-customized
   Criar a pipeline apenas com a task buildah-customized

   deu erro pois o pod exige privilegios de execucao
   oc adm policy add-scc-to-user privileged -z pipeline -n hello
   funcionou

Criar as outras tasks
git-commit-manifest
kustomize-update-manifest

Houve erro de permissao para commitar no github
Vou criar o secret e associar ao sa pipeline

Pequeno ajuste para verificar se inicia a pipeline. .

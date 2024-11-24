# IaC for Azure Kubernetes Service

## Prerrequisitos

Antes de ejecutar el flujo de trabajo de Terraform en GitHub Actions, asegúrate de cumplir con los siguientes prerrequisitos:

1. **Cuenta de Azure**: Necesitas una cuenta de Azure activa. Si no tienes una, puedes crear una en [portal.azure.com](https://portal.azure.com).

2. **Código en un repositorio de GitHub**: Asegúrate de que el código de Terraform esté en un repositorio de GitHub. Si aún no lo has hecho, crea un nuevo repositorio y sube tu código.

## Preparación

Sigue estos pasos para preparar tu entorno en Azure:

1. **Iniciar sesión en Azure**:
   ```bash
   az login
   ```

2. **Crear un grupo de recursos**:
   ```bash
   az group create --name aksResourceGroup --location westus2
   ```

3. **Crear una cuenta de almacenamiento**:
   ```bash
   az storage account create --name storageaccountpvb --resource-group aksResourceGroup --location westus2 --sku Standard_LRS
   ```

4. **Crear un contenedor de almacenamiento**:
   ```bash
   az storage container create --name containerpvb --account-name storageaccountpvb --public-access blob
   ```

5. **Crear un Service Principal**:
   ```bash
   az ad sp create-for-rbac --name "myServicePrincipal" --role="Contributor" --scopes="/subscriptions/{subscription-id}/resourceGroups/aksResourceGroup" --sdk-auth
   ```

6. **Add Federated Credential to Azure App Registration**:

   1. Go to the Azure Portal.
   2. Select "Azure Active Directory" in the left sidebar.
   3. Click on "App registrations" and select your app registration.
   4. In the left sidebar, select "Certificates & secrets".
   5. Click on the "Federated credentials" tab.
   6. Click the "Add credential" button.
   7. Configure the federated credential:
      - **Issuer**: Select GitHub.
      - **Subject Identifier**: Use the format repo:<GitHub-organization>/<GitHub-repository>:ref:refs/heads/<branch-name>.
      - **Name**: Provide a name for the federated credential.
      - **Description**: Optionally, provide a description.
   8. Click the "Add" button to save the federated credential.

## Configuración de GitHub Actions

Para ejecutar el flujo de trabajo de Terraform en GitHub Actions, necesitas configurar los siguientes secretos en tu repositorio:

- `AZURE_CLIENT_ID`: El ID del cliente del Service Principal de Azure.
- `AZURE_CLIENT_SECRET`: El secreto del cliente del Service Principal de Azure.
- `AZURE_TENANT_ID`: El ID del inquilino de Azure.
- `AZURE_SUBSCRIPTION_ID`: El ID de la suscripción de Azure.
- `RESOURCE_GROUP_NAME`: El nombre del grupo de recursos de Azure.
- `STORAGE_ACCOUNT_NAME`: El nombre de la cuenta de almacenamiento de Azure.
- `CONTAINER_NAME`: El nombre del contenedor de almacenamiento de Azure.
- `AKS_CLUSTER_NAME`: El nombre del clúster de AKS.
- `ACR_NAME`: El nombre del registro de contenedores de Azure.

Para añadir estos secretos, sigue estos pasos:

1. Ve a la página principal de tu repositorio en GitHub.
2. Haz clic en `Settings` (Configuración).
3. En la barra lateral izquierda, haz clic en `Secrets` (Secretos).
4. Haz clic en `New repository secret` (Nuevo secreto del repositorio).
5. Añade cada uno de los secretos mencionados anteriormente.

Una vez configurados los secretos, el flujo de trabajo de GitHub Actions podrá acceder a ellos y ejecutar los comandos de Terraform correctamente.

## Ejecución de Workflows

Para aprovisionar toda la infraestructura, ejecuta el workflow `Terraform Apply` en GitHub Actions. Para revertir la infraestructura, ejecuta el workflow `Terraform Destroy`. Ambos workflows se ejecutan a demanda.

### Ejecución del Workflow Terraform Apply

1. Ve a la página principal de tu repositorio en GitHub.
2. Haz clic en `Actions` (Acciones).
3. En la lista de workflows, selecciona `Terraform Apply`.
4. Haz clic en `Run workflow` (Ejecutar flujo de trabajo).
5. En el menú desplegable, selecciona la rama en la que deseas ejecutar el workflow.
6. Haz clic en el botón `Run workflow` para iniciar la ejecución.

### Ejecución del Workflow Terraform Destroy

1. Ve a la página principal de tu repositorio en GitHub.
2. Haz clic en `Actions` (Acciones).
3. En la lista de workflows, selecciona `Terraform Destroy`.
4. Haz clic en `Run workflow` (Ejecutar flujo de trabajo).
5. En el menú desplegable, selecciona la rama en la que deseas ejecutar el workflow.
6. Haz clic en el botón `Run workflow` para iniciar la ejecución.

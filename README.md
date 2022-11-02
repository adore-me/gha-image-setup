# gha-image-setup

## Description
Composes a fully qualified image address.  
ℹ The `tag` of the image is expected to be provided through a config file in your project, `./ci/config.yaml` (can be configured through `config-location` input) with key `image-tag`  
ℹ If the input `tag` is provided then this source will be used instead of config file.

## Inputs 
| Key                 | Required  | Default            | Description                                                |
|---------------------|-----------|--------------------|------------------------------------------------------------|
| **tag**             | **false** | `''`               | Image tag.                                                 |
| **registry**        | **true**  | `quay.io`          | Docker registry to use.                                    |
| **repository**      | **true**  | `adoreme`          | Docker repository to use.                                  |
| **name**            | **true**  | `nginx-fpm-alpine` | Image name.                                                |
| **config-location** | **true**  | `./ci/config.yaml` | Path of the config file containing `image-tag` in project. |

## Outputs
| Key                     | Description                    |
|-------------------------|--------------------------------|
| **project-image**       | Fully qualified image address. |
| **project-image-tag**   | Image tag.                     |

ℹ Also sets a `PROJECT_IMAGE` env variable globally available.

### Example of step configuration and usage:
```yaml
steps:
  - name: 'Run Image Setup'
    id: image-setup
    uses: adore-me/gha-image-setup@master
  - name: 'Print image setup output'
    run: |
      echo "Image address: ${{ steps.image-setup.outputs.project-image }}"
```

# gha-image-setup

## Description
Composes a fully qualified image address.

## Inputs 
| Key                   | Required  | Default            | Description                                                                                |
|-----------------------|-----------|--------------------|--------------------------------------------------------------------------------------------|
| **docker-registry**   | **true**  | `quay.io`          | Docker registry to use.                                                                    |
| **docker-repository** | **true**  | `adoreme`          | Docker repository to use.                                                                  |
| **image-name**        | **true**  | `nginx-fpm-alpine` | Image name.                                                                                |
| **image-tag**         | **false** | `''`               | Image tag. If env variable `IMAGE_TAG` is set you don't need to specify it again in input. |

## Outputs
| Key                   | Description                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| **image-address**     | Fully qualified image address.                                              |

### Example of step configuration and usage:
```yaml
steps:
  - name: 'Run Image Setup'
    id: image-setup
    uses: adore-me/gha-image-setup@master
    with:
      image-tag: SOME_IMAGE_TAG # Not needed if `env.IMAGE_TAG` is set.
  - name: 'Print image setup output'
    run: |
      echo "Image address: ${{ steps.image-setup.outputs.image-address }}"
```

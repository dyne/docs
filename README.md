# Documentation and Manauls of Dyne.org products

## Install dependencies

You need to have mkdocs and the material plugin installed:
```
apt-get install mkdocs
pip install mkdocs-material
```

## Create a new project

Go inside the `src/` folder and use `mkdocs new name_of_project`.

Beware the name you chose will also be in the url `https://dyne.org/docs/name_of_project`.

Go inside the freshly created project folder and use mkdocs as usual

👁️ preview using `mkdocs serve` directly in each src/ folder.

⚠️⚠️  never do `mkdocs deploy`! But instead...

## Publish changes

Go in the root of this repository and do `make deploy`.

If there are no changes in the src files then an error will be returned and no commit created.

Read carefully the errors returned because some warnings contain useful information.


## Further questions

Ask Jaromil or Settoshi

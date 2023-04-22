# NVim config

## To enable autocomplete

Firts of all, you need to instal coq dependencies. OPen nvim and execute:
```
:COQdeps
```

Now, you need to install all the lsp language servers
- Install lsp languages:
```
npm install -g pyright
npm install -g typescript-language-server typescript
npm i -g bash-language-server
```

### Enable TypeScript language server

```
typescript-language-server --stdio
```

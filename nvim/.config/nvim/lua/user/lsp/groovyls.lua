local dir = os.getenv("HOME") .. "/groovy-language-server/build/libs/groovy-language-server-all.jar"
require("lspconfig").groovyls.setup({
  cmd = { "java", "-jar", dir },
})

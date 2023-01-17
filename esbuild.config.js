const esbuild = require("esbuild")

esbuild
  .build({
    entryPoints: ["./app/javascript/application.js"],
    outdir: "app/assets/builds/",
    logLevel: "info",
    bundle: true,
    minify: process.env.NODE_ENV === "production",
    platform: "browser",
    sourcemap: true,
    define: {
      "process.env.NODE_ENV": `'${process.env.NODE_ENV || "development"}'`
    }
  })
  .then(result => {
    if (result.stop) process.on("SIGINT", () => result.stop())
  })


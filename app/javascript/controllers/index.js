// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "./application";

export function autoloadControllers(app) {
  const context = require.context(".", true, /\.js$/);
  context.keys().forEach((key) => {
    if (key === "./index.js" || key === "./application.js") return;
    const controllerName = key.replace("./", "").replace(".js", "");
    app.register(controllerName, context(key).default);
  });
}


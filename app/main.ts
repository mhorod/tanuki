import app from "./app.ts";

const port = 3000;
app.set("port", port);
app.listen(port, () => console.log("App is running :)"));

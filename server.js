const express = require("express");
const app = express();

const port = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.send(
    "Jenkins Docker CI/CD is working! Build ID: " +
    (process.env.BUILD_ID || "local") +
    ", Git Commit: " +
    (process.env.GIT_COMMIT || "local")
  );
});

app.listen(port, "0.0.0.0", () => {
  console.log("Application running on port " + port);
});

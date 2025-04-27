import js from "@eslint/js";
import globals from "globals";
import parser from "@typescript-eslint/parser";
import { configs } from "@typescript-eslint/eslint-plugin";
import { defineConfig } from "eslint/config";


export default defineConfig([
  {
    files:["**/*.{js,mjs,cjs,ts}"],
    languageOptions: {
      parser,
      parserOptions: {
        project: "./tsconfig.json",
      },
      globals: globals.browser,
    },
    plugins: {
      "@typescript-eslint": configs.recommended.plugins["@typescript-eslint"],
      js,
    },
    rules: {
      ...js.configs.recommended.rules,
      ...configs.recommended.rules,
    },
  },
]);
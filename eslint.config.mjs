import js from "@eslint/js";
import globals from "globals";
import parser from "@typescript-eslint/parser";
import tsPlugin from "@typescript-eslint/eslint-plugin";
import { defineConfig } from "eslint/config";

export default defineConfig([
  {
    files:["**/*.{js,mjs,cjs,ts}"],
    languageOptions: {
      parser,
      parserOptions: {
        project: "./tsconfig.json",
      },
      globals: {
        ...globals.browser,
        ...globals.mocha,
      },
    },
    plugins: {
      "@typescript-eslint": tsPlugin,
      js,
    },
    rules: {
      ...js.configs.recommended.rules,
      ...tsPlugin.configs.recommended.rules,
    },
  },
]);
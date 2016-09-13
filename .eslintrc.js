module.exports = {
  "rules": {
    "indent": [2, 2, {
      "SwitchCase": 1
    }],
    "quotes": [2, "single"],
    "linebreak-style": [2, "unix"],
    "semi": [2, "always"]
  },
  "env": {
    "es6": true,
    "node": true,
    "browser": true
  },
  "parserOptions": {
    "sourceType": "module"
  },
  "extends": "eslint:recommended"
};

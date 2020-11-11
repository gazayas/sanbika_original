/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/key_change.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/key_change.js":
/*!********************************************!*\
  !*** ./app/javascript/packs/key_change.js ***!
  \********************************************/
/*! no static exports found */
/***/ (function(module, exports) {

throw new Error("Module build failed (from ./node_modules/babel-loader/lib/index.js):\nSyntaxError: /home/gabriel/ror/sanbika/app/javascript/packs/key_change.js: Unexpected token, expected \",\" (166:34)\n\n  164 |           $('.set_list_song').on(\n  165 |               'load',\n> 166 |               console.log(\"hello\");\n      |                                   ^\n  167 |              // key_change(original_key, null, new_key, song_bodies[i])\n  168 |           )\n  169 |         );\n    at Parser._raise (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:799:17)\n    at Parser.raiseWithData (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:792:17)\n    at Parser.raise (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:786:17)\n    at Parser.unexpected (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9089:16)\n    at Parser.expect (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9075:28)\n    at Parser.parseCallExpressionArguments (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:10167:14)\n    at Parser.parseCoverCallAndAsyncArrowHead (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:10092:29)\n    at Parser.parseSubscript (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:10028:19)\n    at Parser.parseSubscripts (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9999:19)\n    at Parser.parseExprSubscripts (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9982:17)\n    at Parser.parseUpdate (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9956:21)\n    at Parser.parseMaybeUnary (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9945:17)\n    at Parser.parseExprOps (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9815:23)\n    at Parser.parseMaybeConditional (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9789:23)\n    at Parser.parseMaybeAssign (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9752:21)\n    at Parser.parseFunctionBody (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:11101:24)\n    at Parser.parseArrowExpression (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:11077:10)\n    at Parser.parseParenAndDistinguishExpression (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:10635:12)\n    at Parser.parseExprAtom (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:10311:21)\n    at Parser.parseExprSubscripts (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9976:23)\n    at Parser.parseUpdate (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9956:21)\n    at Parser.parseMaybeUnary (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9945:17)\n    at Parser.parseExprOps (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9815:23)\n    at Parser.parseMaybeConditional (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9789:23)\n    at Parser.parseMaybeAssign (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9752:21)\n    at allowInAnd (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9718:39)\n    at Parser.allowInAnd (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:11448:12)\n    at Parser.parseMaybeAssignAllowIn (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9718:17)\n    at Parser.parseExprListItem (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:11196:18)\n    at Parser.parseCallExpressionArguments (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:10187:22)");

/***/ })

/******/ });
//# sourceMappingURL=key_change-366c8a4acf60f99c05a3.js.map
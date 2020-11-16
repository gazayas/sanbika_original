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
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/initialize_song.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/initialize_song.js":
/*!*************************************************!*\
  !*** ./app/javascript/packs/initialize_song.js ***!
  \*************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

throw new Error("Module build failed (from ./node_modules/babel-loader/lib/index.js):\nSyntaxError: /Users/gabriel_zayas/ror/sanbika/app/javascript/packs/initialize_song.js: Unexpected token (13:21)\n\n  11 | // is_sharp and is_flat\n  12 | function check_sharp(note) {\n> 13 |   /#|♯/.test(note) ? return true : return false;\n     |                      ^\n  14 | }\n  15 | \n  16 | function check_flat(note) {\n    at Parser._raise (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:799:17)\n    at Parser.raiseWithData (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:792:17)\n    at Parser.raise (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:786:17)\n    at Parser.unexpected (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:9089:16)\n    at Parser.parseExprAtom (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:10416:20)\n    at Parser.parseExprSubscripts (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:9976:23)\n    at Parser.parseUpdate (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:9956:21)\n    at Parser.parseMaybeUnary (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:9945:17)\n    at Parser.parseExprOps (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:9815:23)\n    at Parser.parseMaybeConditional (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:9789:23)\n    at Parser.parseMaybeAssign (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:9752:21)\n    at /Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:9718:39\n    at Parser.allowInAnd (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:11448:12)\n    at Parser.parseMaybeAssignAllowIn (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:9718:17)\n    at Parser.parseConditional (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:9802:30)\n    at Parser.parseMaybeConditional (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:9795:17)\n    at Parser.parseMaybeAssign (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:9752:21)\n    at Parser.parseExpressionBase (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:9696:23)\n    at /Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:9690:39\n    at Parser.allowInAnd (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:11442:16)\n    at Parser.parseExpression (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:9690:17)\n    at Parser.parseStatementContent (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:11708:23)\n    at Parser.parseStatement (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:11577:17)\n    at Parser.parseBlockOrModuleBlockBody (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:12159:25)\n    at Parser.parseBlockBody (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:12145:10)\n    at Parser.parseBlock (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:12129:10)\n    at Parser.parseFunctionBody (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:11108:24)\n    at Parser.parseFunctionBodyAndFinish (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:11091:10)\n    at /Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:12299:12\n    at Parser.withTopicForbiddingContext (/Users/gabriel_zayas/ror/sanbika/node_modules/@babel/parser/lib/index.js:11417:14)");

/***/ })

/******/ });
//# sourceMappingURL=initialize_song-5f51a8cd24e609f20b6e.js.map
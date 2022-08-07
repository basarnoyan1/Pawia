import 'dart:math';

var vowels = ["a", "e", "ı", "i", "u", "ü", "o", "ö"];

extension TurkishTools on String {
  String genitive(bool special) {
    var len = this.length;
    var result = this +
        (special ? "'" : "") +
        (vowels.contains(this[len - 1]) ? "n" : "");
    var indxs = [0];
    vowels.forEach((letter) {
      indxs.add(this.indexOf(letter));
    });

    var last_vowel = vowels[indxs.indexOf(indxs.reduce(max))];
    switch (last_vowel) {
      case "a":
      case "ı":
        return this + "ın";
      case "e":
      case "i":
        return this + "in";
      case "o":
      case "u":
        return this + "un";
      case "ö":
      case "ü":
        return this + "ün";
      default:
        return this + "ın";
    }
  }

  String possessive(bool special) {
    var len = this.length;
    var result = this +
        (special ? "'" : "") +
        (vowels.contains(this[len - 1]) ? "s" : "");
    var indxs = [0];
    vowels.forEach((letter) {
      indxs.add(this.indexOf(letter));
    });

    var last_vowel = vowels[indxs.indexOf(indxs.reduce(max))];
    switch (last_vowel) {
      case "a":
      case "ı":
        return this + "ı";
      case "e":
      case "i":
        return this + "i";
      case "o":
      case "u":
        return this + "u";
      case "ö":
      case "ü":
        return this + "ü";
      default:
        return this + "ı";
    }
  }
}

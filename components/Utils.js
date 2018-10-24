function func() {

}
function sliderLogMap() {
    return 1. + Math.log(linearMap())
}
function logslider(position) {
    console.log("logslider call with:"+position)
    //The resulting values match a logarithmic scale:
  // position will be between 2 and 598
  var minp = 2;
  var maxp = 598;

  // The result should be between 25 an 1500
  var minv = Math.log(25);
  var maxv = Math.log(1500);

  // calculate adjustment factor
  var scale = (maxv-minv) / (maxp-minp);
  console.log(Math.exp(minv + scale*(position-minp)))
  return Math.exp(minv + scale*(position-minp));
}
function distance(x1, y1, x2, y2) {
    var a = x1 - x2
    var b = y1 - y2

    return Math.sqrt(a * a + b * b)
}

function clamp(val, min, max) {
    return Math.min(Math.max(val, min), max)
}

// a : source range; b : target range.
// val in [a0; a1] is scaled to [b0; b1]
function rescale(val, a0, a1, b0, b1) {
    var coeff = (b1 - b0) / (a1 - a0)
    return b0 + coeff * (val - a0)
}

function clampRescale(val, a0, a1, b0, b1) {
    return rescale(clamp(val, a0, a1), a0, a1, b0, b1)
}

function inside(x, y, areaX, areaY, areaWidth, areaHeight) {
    return x > areaX && y > areaY && x < (areaX + areaWidth)
            && y < (areaY + areaHeight)
}

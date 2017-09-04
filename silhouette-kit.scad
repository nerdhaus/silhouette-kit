use <fonts/nerdhaus.otf>

/*
 The Nerdhaus font has a bunch of symbols for silhouette generation.
 
 qwertyuio: Infantry
 asdfghjkl: civilians
 zxcvbnm,.: animals and monsters
 QWERTYUIO: zombies
 
 Ñ: The nerdhaus logo
*/
infantry = ["q", "w", "e", "r", "t", "y", "u", "i", "o"];
civilians = ["a", "s", "d", "f", "g", "h", "j", "k", "l"];
monsters = ["z", "x", "c", "v", "b", "n", "m", ",", "."];
zombies = ["Q", "W", "E", "R", "T", "Y"];

makeGrid(["g"]);

module makeGrid(chars) {
  rows = round(sqrt(len(chars)));
  for (i = [0 : len(chars) - 1]) {
    translate(position(i, rows))
    silhouette(chars[i]);
  }
}

module silhouette(string="a") {
  linear_extrude(2)
  union() {
    difference() {
      text(str(string), size=32, font="Nerdhaus", valign="bottom", halign="center");
      translate([0,0]) square([40,4], center=true);
    }
    polygon([[-9,2], [-8,0], [8,0], [9,2]]);

  }
}

function position(current, rows) = [(current % rows)*50, round(current/rows - .2)*50];
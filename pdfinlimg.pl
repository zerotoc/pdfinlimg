#!/usr/bin/perl

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

use GD;
use IO::Compress::Deflate qw(deflate);

unless(defined $ARGV[0]) {
  die("No filename provided");
}

my $filename = $ARGV[0];
unless(-e $filename) {
  die("File does not exist");
}

$image = GD::Image->new($filename);
unless(defined $image) {
  die("Corrupt/invalid image provided (supports PNG and JPEG)");
}

my ($width,$height) = $image->getBounds();
my @data;

for(my $y=0;$y<$height;$y++){
for(my $x=0;$x<$width;$x++){
my $index = $image->getPixel($x,$y);
my @rgb = $image->rgb($index);
push(@data, chr($rgb[0]));
push(@data, chr($rgb[1]));
push(@data, chr($rgb[2]));
}
}

my $raw = join('', @data);

my $output;
deflate \$raw => \$output;

printf("\\pdfinlimg{%d}{%d}{%d}{%d}{",int($width/28), int($height/28), $width, $height);
for(my $i=0;$i<length($output);$i++){
if($i % 40 == 0){
print "\n";
}
printf('%02X', ord(substr($output,$i,1)));
}
print "\n}\n";


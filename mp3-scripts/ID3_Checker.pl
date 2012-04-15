use strict;
use warnings;
use MP3::Tag;
use Data::Dumper;

$| = 1;

my $indent = 0;
my $tab = "   ";
recurse($ARGV[0]);

exit 0;

sub recurse
{
    my ($parent_dir, $sub_dir) = @_;

    $sub_dir ||= '';

    opendir(DIR, "$parent_dir$sub_dir");
    my @dirList = readdir(DIR);
    closedir(DIR);

    foreach my $entry (@dirList)
    {
        #ensure that each album in the list is a valid directory, excluding . and ..
        next if($entry =~ /^\.\.?/);

        $indent++;
        if(-d "$parent_dir$sub_dir/$entry") {
            #recurse("$parent_dir/$sub_dir/",$entry) if(! ("$parent_dir$sub_dir" eq "." && $entry =~ /^(Anime|Compilation Albums|Full Albums|Games|Movies)$/));
            recurse("$parent_dir/$sub_dir/",$entry);
        }
        elsif($entry =~ /\.mp3$/) {
            checkFile("$parent_dir$sub_dir/",$entry);
        }
        $indent--;
    }
}

sub checkFile
{
    my ($dir, $entry) = @_;

    my $mp3 = MP3::Tag->new("$dir/$entry") ;
    if(! $mp3) {
        print "MP3: $dir/$entry\n";
        return;
    }

    $mp3->get_tags();

    if(! exists $mp3->{ID3v2} || ! exists $mp3->{ID3v1}) {
        print "TAGS: $dir/$entry\n";
        return;
    }

    my $artist = $mp3->{ID3v2}->artist || $mp3->{ID3v1}->artist;
    my $title = $mp3->{ID3v2}->title || $mp3->{ID3v1}->title;
    my $album = $mp3->{ID3v2}->album || $mp3->{ID3v1}->album;
    if(! $artist || ! $title || ! $album) {
        #if(! $artist || ! $title) {
        print "ITEMS: $dir/$entry : " . ($artist || 'undef') ." - ". ($title || 'undef') ." - ". ($album || 'undef') ."\n";

    } elsif($artist =~ /^artist$/i) {
        print "ARTIST: $dir/$entry : $artist - $title\n";
    }
    $mp3->close();
}

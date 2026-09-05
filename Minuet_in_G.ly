\version "2.24.0"

\header {
  title = "Minuet in G major"
  subtitle = "Arranged for Classical Guitar"
  composer = "Christian Petzold (attr. J. S. Bach)"
  opus = "BWV Anh. 114"
}

global = {
  \key g \major
  \time 3/4
  \clef "treble_8"
}

% --- Part A (Lower Octave) ---
melodyA = \relative c' {
  d4 g,8 a b c | d4 g, g | e'4 c8 d e fis | g4 g, g | \break
  c4 d8 c b a | b4 c8 b a g | fis4 g8 a b g | a2. | \break
  d4 g,8 a b c | d4 g, g | e'4 c8 d e fis | g4 g, g | \break
  c4 d8 c b a | b4 c8 b a g | a4 b8 a g fis | g2. |
}

bassA = \relative c {
  g2. | b2. | c2. | b2. |
  a4 r r | g4 r r | d'4 r r | d,2. |
  g2. | b2. | c2. | b2. |
  a4 r r | g4 r r | d'4 r d, | g2. |
}

% --- Part B (Raised One Octave) ---
melodyB = \relative c'' {
  b4 g8 a b g | a4 d,8 e fis d | g4 a8 g fis e | fis4 d r | \break
  g4 e8 fis g e | fis4 d8 e fis d | e4 fis8 e d cis | d2. | \break
  d4 g,8 fis g4 | e'4 g,8 fis g4 | d'4 c b | a8 g fis g a4 | \break
  d,4 e8 fis g a | b4 c8 d e fis | g4 d8 c b a | g2. |
}

bassB = \relative c' {
  g4 r r | fis4 r r | e4 r r | d4 r r |
  e4 r r | d4 r r | cis4 r r | d2. |
  b'4 r r | c4 r r | b4 a g | d2. |
  fis4 r r | g4 r r | b4 c d | g,2. |
}

\score {
  \new Staff \with {
    \consists "Span_arpeggio_engraver"
  } {
    \global
    
    % Part A
    \repeat volta 2 {
      <<
        \new Voice { \voiceOne \melodyA }
        \new Voice { \voiceTwo \bassA }
      >>
    }
    
    % Part B - Shifted up one octave
    \repeat volta 2 {
      <<
        \new Voice { \voiceOne \melodyB }
        \new Voice { \voiceTwo \bassB }
      >>
    }
  }
  \layout { }
  \midi { \tempo 4 = 116 }
}
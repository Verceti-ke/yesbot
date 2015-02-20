:- module(emoticons, [emoticons/1]).

:- use_module(dispatch).

chan("##prolog").

emoticons(Msg) :-
  chan(Chan),
  Msg = msg(_Prefix, "PRIVMSG", [Chan], [63,115,109,105,108,101,121,32|C]),
  emoticon_english(C, Eng),
  send_msg(priv_msg, X, Chan).
  send_msg(priv_msg, Eng, Chan).
  

%--------------------------------------------------------------------------------%


emoticon_english(Emote, Eng) :-
  atomic(Emote),
  write_to_chars(Emote, EmoteCodes),
  emoticon_english(EmoteCodes, Eng).
emoticon_english(Emote, Eng) :-
  with_output_to(codes(Eng), phrase(emote, Emote)).

emote --> "8cD",
	{
	   format('Annie is her usual happy self', [])
	}.

emote -->
  part(hat, H),
  part(eyebrows, Eb),
  part(eyes, E),
  part(nose, N),
  part(mouth, M),
  {
   format('~s ~s ~s ~s ~s', [H,Eb,E,N,M])
  }.

emote --> ...,
{
 format('darned if I know, half the time they confuse me too', [])
}.

... --> [].
... --> [_], ... .

part(Type, Say) -->
  {
   meaning(Type, X, Say)
  },
  X.

meaning(hat, "", "").
meaning(hat, "d", "baseball cap worn sideways, or hat in general").
meaning(hat, "&", "brain (brainy, or fried), or hair").
meaning(hat, ")&$#|", "Carmen Miranda Hat").
meaning(hat, "<", "Dunce cap, pointed head, or thinking cap").
meaning(hat, ">", "Antenna").
meaning(hat, "=", "hair standing on end").
meaning(hat, "", "").
meaning(eyebrows, ">", "inner eyebrows down, expressing worry or consternation").
meaning(eyebrows, "|", "eyebrows corrugated, expressing sternness").
meaning(eyebrows, "", "").
meaning(eyes, "8", "").
meaning(eyes, "B", "sunglasses").
meaning(eyes, ":", "beady eyes").
meaning(eyes, "X", "eyes closed or covered, in grief, disbelief, or pain").
meaning(eyes, "o", "I'm	a cyclops").
meaning(eyes, "88", "wearing glasses").
meaning(eyes, ";", "winking").
meaning(nose, "c", "").
meaning(nose, "C", "big nose").
meaning(nose, "c:", "button nose").
meaning(nose, [X], "non annie nose, reference to others") :-
  member(X, "2^o-uUOvV>").
meaning(mouth, "*", "kissing").
meaning(mouth, "+", "puckered mouth").
meaning(mouth, "(", "sad").
meaning(mouth, ")", "happy, smile").
meaning(mouth, "E", "toothy (maybe gap tooth dumb)").
meaning(mouth, "o", "o mouth, suprise or shock").
meaning(mouth, "O", "mouth agape, shock").
meaning(mouth, "[", "stern or painful grimace").
meaning(mouth, "]", "trying not to laugh, or smile").
meaning(mouth, "|", "closed mouth look").
meaning(mouth, "S", "discomfort, pain").
meaning(mouth, "d", "tongue hanging out (delicious, distaste, or concentration)").
meaning(mouth, "D", "Very happy - or default").
meaning(mouth, "F", "Vampire fangs").
meaning(mouth, "7", "variant mouth").
meaning(mouth, "X", "puckered mouth - pain, good grief, or ouch").
meaning(mouth, "C", "sticking out lower lip").
meaning(mouth, ">", "variant smile").
meaning(mouth, "?", "puzzlement, empathy, or concern").
meaning(mouth, "p", "tongue hanging out (delicious, distaste, or concentration)").
meaning(mouth, "P", "tongue hanging out (delicious, distaste, or concentration)").
meaning(mouth, [X], "irony") :-
  member(X, "/\\").

% Name: Cory Siebler
% ASU ID: 1000832292
% Class: CSE471 MW 4:30-5:45
% Description: Muppets Amusement Park Puzzle

%--------------------------------------%
% Define the Predicates for the Puzzle %
%--------------------------------------%

% The Three Famous Muppets
muppet(kermit; piggy; fozzie).

% The Three method of Transportation
transport(bus, bike, car).

% The Three Amusement Parks
park(disney, marine, magic).

%---------------------------------%
% Define the Rules for the Puzzle %
%---------------------------------%

% Each Muppet visited exactly one Amusement Park
1 { visited(X,Y) : park(Y) } 1 := muppet(X).

% Each Muppet used exactly one method of Transportation.
1 { rode(X,Y) : muppet(X) } 1 := transport(Y).

% Each Amusement Park was visited by exactly one Muppet
1 { visited(X,Y) : muppet(X) } 1 := park(Y).

%---------------------------------%
% Define the Clues for the Puzzle %
%---------------------------------%

% Kermit went to Disneyland
:- visited(kermit, disney).

% The Muppet that went to Marine World did not ride a bike
:- muppet(X), visited(X,marine), not rode(X,bike).

% Miss Piggy went in a car
:- rode(piggy,car).

% Fozzie Bear did not ride the bus
:- not rode(fozzie,bus).

% Only one Muppet went to Magic Mountain
1 { visited(X,magic) : muppet(X) } 1 := park(magic).

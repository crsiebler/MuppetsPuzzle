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
transport(bus; bike; car).

% The Three Amusement Parks
park(disney; marine; magic).

%---------------------------------%
% Define the Rules for the Puzzle %
%---------------------------------%

% Each Muppet visited their favorite Amusement Park
1 { visited(X,Y) : park(Y) } 1 :- muppet(X).
1 { visited(X,Y) : muppet(X) } 1 :- park(Y).

% Each Muppet used exactly one method of Transportation
1 { rode(X,Y) : muppet(X) } 1 :- transport(Y).
1 { rode(X,Y) : transport(Y) } 1 :- muppet(X).

%---------------------------------%
% Define the Clues for the Puzzle %
%---------------------------------%

% Kermit went to Disneyland
:- not visited(kermit, disney).

% The Muppet that went to Marine World did not ride a bike
:- muppet(X), visited(X,marine), not rode(X,bike).

% Miss Piggy went in a car
:- not rode(piggy,car).

% Fozzie Bear did not ride the bus
:- rode(fozzie,bus).

% Only one Muppet went to Magic Mountain
1 { visited(X,magic) : muppet(X) } 1 :- park(magic).

%------------------------------%
% Hide irrrelevant information %
%------------------------------% 

#show visited/2.
#show rode/2.

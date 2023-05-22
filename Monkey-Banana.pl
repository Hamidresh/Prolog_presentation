do(state(middle,onbox,middle,hasnot),   % grab banana
   grasp,
   state(middle,onbox,middle,has)).

do(state(L,onfloor,L,Banana),           % climb box
   climb,
   state(L,onbox,L,Banana)).

do(state(L1,onfloor,L1,Banana),         % push box from L1 to L2
   push(L1,L2),
   state(L2,onfloor,L2,Banana)).

do(state(L1,onfloor,Box,Banana),        % walk from L1 to L2
   walk(L1,L2),
   state(L2,onfloor,Box,Banana)).

canget(state(_,_,_,has)).               % Monkey already has it, goal state

canget(State1) :-                       % not goal state, do some work to get it
   do(State1,_,State2),                 % do something (grab, climb, push, walk)
   canget(State2).                      % canget from State2

%-------------------OutPut Query------------------------>
%
%canget(state(atdoor, onfloor, atwindow, hasnot)).
%true.
%
%canget(state(atwindow, onbox, atwindow, hasnot)).
%false.





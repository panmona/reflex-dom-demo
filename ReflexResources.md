# Reflex Resources

This document provides some helpful links to get you started more easily with using Reflex.
Do not worry if you do not understand everything at first.
Learning FRP can feel similar to learning functional programming all over again.

## Tutorials

- An easy to read introduction: https://github.com/hansroland/reflex-dom-inbits/blob/master/tutorial.md
- The tutorial series from Queensland FP Lab: https://qfpl.io/projects/reflex/
  - Especially their tutorial on switching: https://qfpl.io/posts/reflex/basics/switching/
- The tutorial series from Typeable: https://typeable.io/blog/2021-03-15-reflex-1.html
- The tutorial series by Acetalent: https://www.youtube.com/watch?v=Uvtri81LEXY and https://www.youtube.com/watch?v=7MuX6Z2AB70
- The official reflex tutorial, which is more advanced (note: the other tutorials are easier to understand): https://reflex-frp.org/tutorial

## Reflex Documentation

- Use the local hoogle setup (in .build/hoogle.sh) to be able to search most of the Reflex types.
- Use the Hackage documentation of reflex-dom and search for your functions: https://hackage.haskell.org/package/reflex-dom-core-0.8.1.2/docs/doc-index-All.html
- Use the Hackage documentation of reflex and search for your functions: https://hackage.haskell.org/package/reflex-0.9.3.3/docs/doc-index-All.html
- Use the Hackage documentation of ghcjs-dom and search for your functions: https://hackage.haskell.org/package/jsaddle-dom-0.9.9.2/docs/doc-index-All.html (Please note that you will always need to change the imports to GHCJS.DOM.{foo} as we do not use jsaddle-dom directly but ghcjs-dom. However, documentation for ghcjs-dom is only provided via jsaddle-dom.)

## Repositories
Sometimes you want to use a function but are not quite sure how it works, and there is no usage documentation to guide you.
In that case it is helpful to search GitHub with a Haskell filter for the function you are trying to use.
Additionally, the following repositories have been useful to find specific examples:
- https://github.com/obsidiansystems/rhyolite
- https://github.com/typeable/octopod
- https://github.com/qfpl/reflex-realworld-example
- https://github.com/mightybyte/reflex-2048
- https://github.com/jecaro/diverk/

## forall
When using ScopedTypeVariables, which is by default enabled in this project and needed for creating an ElementConfig, you will end up needing to use an explicit forall.
Otherwise, two different type variables will be automatically created by Haskell.

## Recommendations
Once you get started with Reflex here are some recommendations from our experience:
- In most cases, apply the principle that the input for widgets should be Dynamics containing the current widget state and the output Events which reflect how the user interacted with the widget.
This rule has the advantage that the application has more control over how the state is handled and combined.
Additionally, it enables the use of the following rule.
- Generally, handle the state at the point of the widget tree above all widgets affected by it, but no higher.
This rule has the benefit that a widget only knows as many details of a state as it needs to.
It also ensures that endless rendering loops, which can occur when using "RecursiveDo", do not occur.
During the development of previous projects, these endless rendering loops only occurred in cases where we did not follow this rule.
- Avoid the usage of the "promptly" family of functions (e.g. switchPromptlyDyn, tagPromptlyDyn etc.) as these can create rendering loops if used incorrectly.
The "promptly" functions use the current value of a Dynamic at the time an Event occurs.
This kind of behaviour was never needed in our previous projects.
Instead use the non-promptly counterparts (e.g. switch . current, tag . current), which use the previous value of a Dynamic.
- Use the functions dyn and widgetHold, which extract the pure value out of a Dynamic, at the lowest possible point of the widget tree.
When using dyn/widgetHold, each update of the Dynamic causes a re-render of the whole widget tree below it.
As Reflex does not utilise a virtual DOM, as its design renders one unnecessary, violating this rule can have significant performance impacts if these functions are used too high up in the widget tree.
- When it is necessary to display different widgets based on the value of a Dynamic, it is often more performant to render all widgets and hide the widgets which should not be shown using CSS instead of using widgetHold.
When using this approach the relevant DOM tree that is shown when the value changes already exists and does not need to be recreated every time.

These guidelines are based on experience and the following resources:
- https://docs.reflex-frp.org/en/latest/overview.html.
- https://www.reddit.com/r/reflexfrp/comments/6l5ddn/comment/djsa9r7/
- https://docs.reflex-frp.org/en/latest/app_devel_docs.html#hang-stack-overflow
- https://stackoverflow.com/a/40482715/
- https://stackoverflow.com/a/42616450/


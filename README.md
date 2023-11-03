# todoapp

This project intends to create a descriptive example on how to use
redux with flutter.

## Redux

Redux is a philosophy and a library for managing and updating application state, using events called "actions". It serves as a centralized store for state that needs to be used across your entire application, with rules ensuring that the state can only be updated in a predictable fashion.

## Terms we will come across

### Action

An action is a plain object that represents an intention to change the state. Actions are the only way to get data into the store. Any data, whether from UI events, network callbacks, or other sources such as WebSockets needs to eventually be dispatched as actions.

Actions must have a type field that indicates the type of action being performed. Types can be defined as constants and imported from another module. It’s better to use strings for type than Symbols because strings are serializable.

Other than type, the structure of an action object is really up to you. If you’re interested, check out Flux Standard Action for recommendations on how actions could be constructed.

### Reducer

Reducers are pure functions that take the previous state and an action, and return the next state. Remember to return new state objects, instead of mutating the previous state. You can start with a single reducer, and as your app grows, split it off into smaller reducers that manage specific parts of the state tree. Because reducers are pure functions, they are easy to test, and they lend themselves to certain powerful optimizations. You can control the order in which reducers are called, pass additional data, or even make reusable reducers for common tasks such as pagination.

### Store

A store is an object that holds the application’s state tree. There should only be a single store in a Redux app, as the composition happens on the reducer level.

### Dispatch

This is the only way to trigger a state change. The store’s dispatch method is used to dispatch actions to the Redux store. Calling store.dispatch() with an action object will cause the reducer to be executed with the action object and the current state of the application. The return value of the reducer will be the next state of the application.

### Subscribe

The store’s subscribe method accepts a callback that will be run every time an action is dispatched to the store. You can use this to update the UI of your application to reflect the current app state.

In flutter using the flutter_redux package, we can subscribe to the store and update the UI. We will use StoreConnector to connect the store to the UI.

### Middleware

Middleware provides a third-party extension point between dispatching an action, and the moment it reaches the reducer. People use Redux middleware for logging, crash reporting, talking to an asynchronous API, routing, and more.

#### Sagas vs Thunks

Sagas and Thunks are both middleware that allow you to intercept dispatched actions before they reach the reducer. They can both be used to dispatch additional actions in response to an action that has been dispatched, but they differ in how they do so.

Thunks are functions that are themselves dispatched as actions. When the thunk middleware intercepts a dispatched thunk, it calls the thunk function with dispatch and getState functions as arguments. This allows the thunk to dispatch additional actions, or perform asynchronous tasks before dispatching an action. Thunks are simple to use, but they are not as powerful as sagas.

Sagas are generator functions that are run in the background in response to dispatched actions. Sagas can be used to dispatch additional actions, perform asynchronous tasks, and more. Sagas are more powerful than thunks, but they are also more complicated to use.

## About project

I created this project a part of documenting my learning process. I have tried to explain the code as much as possible. If you find any issues or have any suggestions, please feel free to create an issue or a pull request.

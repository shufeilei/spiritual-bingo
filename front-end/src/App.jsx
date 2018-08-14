import React from 'react';
import { Route, Switch } from 'react-router-dom';

import About from './components/About';
import Connect from './components/Connect';
import Main from './containers/Main';
import Nav from './components/Nav';

export default () => (
  <div>
    <Nav />
    <Switch>
      <Route exact path="/" component={Main} />
      <Route path="/about" component={About} />
    </Switch>
    <Connect />
  </div>
);

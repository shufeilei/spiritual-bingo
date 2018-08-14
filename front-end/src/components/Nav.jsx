/* eslint no-undef: 0 */
import React from 'react';
import { Link } from 'react-router-dom';

const renderHomeOrHash = () => {
  if (window.location.hash === '#/about') {
    return (
      <Link to="/">
        Home
      </Link>
    );
  }

  return (
    <Link to="/about">
      About
    </Link>
  );
};

export default () => (
  <header className="subnav-hero-section bottom-shadow">
    <img className="headline__logo" src="images/iusm-logo.png" alt="iusm-logo.png" />
    <ul className="subnav-hero-subnav">
      <li>
        {renderHomeOrHash()}
      </li>
      <li>
        <a href="https://ism.smugmug.com/IUSM">
          Photos
        </a>
      </li>
      <li>
        <a href="https://www.facebook.com/iusmberkeley/">
          Facebook
        </a>
      </li>
      <li>
        <a href="http://www.igsmberkeley.org/">
          Graduate Student?
        </a>
      </li>
    </ul>
  </header>
);

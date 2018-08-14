import React from 'react';

export default () => (
  <footer className="connect top-shadow">
    <h4 className="connect__headline">
      Connect with us!
    </h4>
    <div className="connect__icons-container">
      <a
        target="_blank"
        rel="noopener noreferrer"
        className="connect__icons-card"
        href="https://www.instagram.com/iusmberkeley/?hl=en"
      >
        <i className="fab fa-instagram connect__icon" />
        <p className="connect__icons-card__description">
          Follow us on Instagram!
        </p>
      </a>
      <a
        target="_blank"
        rel="noopener noreferrer"
        className="connect__icons-card"
        href="https://www.facebook.com/iusmberkeley/"
      >
        <i className="fab fa-facebook connect__icon" />
        <p className="connect__icons-card__description">
          Find us on Facebook!
        </p>
      </a>
      <a
        target="_blank"
        rel="noopener noreferrer"
        className="connect__icons-card"
        href="https://ism.smugmug.com/IUSM"
      >
        <img
          className="fab connect__icon--smugmug"
          src="images/SmugMug_logo.png"
          alt="SmugMug-logo"
        />
        <p className="connect__icons-card__description--smugmug">
          Check out our photos on SmugMug!
        </p>
      </a>
    </div>
  </footer>
);

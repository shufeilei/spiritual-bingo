import React from 'react';
import PropTypes from 'prop-types';

const getArticleRowClassFromIndex = index => (
  index % 2 === 0 ? 'article-row' : 'article-row article-row-reversed'
);

const UpcomingEvent = ({
  backgroundImage, title, description, location, time, index,
}) => (
  <article className={getArticleRowClassFromIndex(index)}>
    <div
      className="article-row-img article-row__image"
      style={{ backgroundImage }}
    />
    <div className="article-row-content">
      <h4 className="article-row-content-title fancy-55">
        { title }
      </h4>
      <p className="article-row-content-description">
        { description }
      </p>
      <p className="article-row-content-author">
        { location }
      </p>
      <time className="article-row-content-time">
        { time }
      </time>
    </div>
  </article>
);

UpcomingEvent.propTypes = {
  backgroundImage: PropTypes.string.isRequired,
  title: PropTypes.string.isRequired,
  description: PropTypes.string.isRequired,
  location: PropTypes.string,
  time: PropTypes.string,
  index: PropTypes.number.isRequired,
};

UpcomingEvent.defaultProps = {
  location: '',
  time: '',
};

export default UpcomingEvent;

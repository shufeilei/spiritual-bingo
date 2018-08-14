import React from 'react';

import UpcomingEvent from './UpcomingEvent';
import { upcomingEventsData } from '../constants';

const renderUpcomingEvents = upcomingEvents => (
  upcomingEvents.map((upcomingEvent, i) => {
    const {
      backgroundImage, title, description, location, time,
    } = upcomingEvent;
    return (
      <UpcomingEvent
        backgroundImage={backgroundImage}
        title={title}
        description={description}
        location={location}
        time={time}
        index={i}
      />
    );
  })
);

export default () => (
  <div className="top-shadow">
    <div className="grid-container">
      <div className="grid-x grid-padding-x">
        <div className="large-12 cell">
          <div className="events-container">
            <h3 className="separator-left about-iusm__title">
              What&rsquo;s happening in IUSM?
            </h3>
            <div className="blue-line callout__blue-line" />
            {renderUpcomingEvents(upcomingEventsData)}
          </div>
        </div>
      </div>
    </div>
  </div>
);

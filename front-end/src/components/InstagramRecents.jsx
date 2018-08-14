/* eslint no-undef: 0 */
import React from 'react';

class InstagramRecents extends React.Component {
  constructor(props) {
    super(props);

    this.feed = new Instafeed({
      get: 'user',
      userId: 8333936523,
      accessToken: '8333936523.aa7989b.69b256686e10482e80332ae9c23c38df',
    });
  }

  componentDidMount() {
    this.feed.run();
  }

  render() {
    return (
      <div className="top-shadow">
        <div className="grid-container">
          <div className="grid-x grid-padding-x">
            <div className="large-12 cell">
              <div className="instagram-recents">
                <h3 className="instagram-recents__title">
                  Check out our Recent Instagram Posts!
                </h3>
                <div id="instafeed" className="instagram-recents__instafeed" />
              </div>
            </div>
          </div>
        </div>
      </div>

    );
  }
}

export default InstagramRecents

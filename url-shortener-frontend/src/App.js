// src/App.js
import React, { useState } from 'react';
import axios from 'axios';

function App() {
  const [originalUrl, setOriginalUrl] = useState('');
  const [shortUrl, setShortUrl] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    const res = await axios.post('http://localhost:3001/shorten', { original_url: originalUrl });
    setShortUrl(res.data.short_url);
  };

  return (
    <div style={{ padding: 30 }}>
      <h1>URL Shortener</h1>
      <form onSubmit={handleSubmit}>
        <input type="text" value={originalUrl} onChange={e => setOriginalUrl(e.target.value)} placeholder="Enter URL" required />
        <button type="submit">Shorten</button>
      </form>
      {shortUrl && (
        <p>Short URL: <a href={shortUrl} target="_blank" rel="noreferrer">{shortUrl}</a></p>
      )}
    </div>
  );
}

export default App;

import { useEffect, useState } from 'react';
import Router from 'next/router';

export default function HomePage() {
  const [user, setUser] = useState(null);
  const API = process.env.NEXT_PUBLIC_API_BASE || '';

  useEffect(() => {
    async function load() {
      const res = await fetch(`${API}/api/auth/profile/`, { credentials: 'include' });
      if (!res.ok) {
        Router.push('/');
        return;
      }
      const j = await res.json();
      setUser(j);
    }
    load();
  }, []);

  if (!user) return <div>Loading...</div>;

  return (
    <div style={{padding: 40}}>
      <h1>Welcome, {user.username}</h1>
      <p>{user.email}</p>
      <button onClick={async () => {
        await fetch(`${API}/api/auth/logout/`, { method: 'POST', credentials: 'include' });
        Router.push('/');
      }}>Logout</button>
    </div>
  );
}

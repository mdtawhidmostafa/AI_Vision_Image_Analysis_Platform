import { useState } from 'react';
import Router from 'next/router';

export default function Index() {
  const [tab, setTab] = useState('login');
  // form state
  const [loginEmail, setLoginEmail] = useState('');
  const [loginPassword, setLoginPassword] = useState('');
  const [signupName, setSignupName] = useState('');
  const [signupEmail, setSignupEmail] = useState('');
  const [signupPassword, setSignupPassword] = useState('');
  const [signupConfirm, setSignupConfirm] = useState('');

  const API = process.env.NEXT_PUBLIC_API_BASE || '';

  async function postJson(url, data) {
    const res = await fetch(url, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      credentials: 'include',
      body: JSON.stringify(data)
    });
    const json = await res.json().catch(() => ({}));
    return { ok: res.ok, status: res.status, data: json };
  }

  async function handleLogin(e) {
    e.preventDefault();
    const payload = { username: loginEmail, password: loginPassword };
    const r = await postJson(`${API}/api/auth/login/`, payload);
    if (r.ok) {
      Router.push('/home');
    } else {
      alert(r.data.detail || 'Login failed');
    }
  }

  async function handleSignup(e) {
    e.preventDefault();
    const username = signupEmail.split('@')[0];
    const [first_name, ...rest] = signupName.trim().split(' ');
    const last_name = rest.join(' ');
    const payload = { username, email: signupEmail, password: signupPassword, password2: signupConfirm, first_name, last_name };
    const r = await postJson(`${API}/api/auth/register/`, payload);
    if (r.ok) {
      alert('Account created. Please sign in.');
      setTab('login');
    } else {
      alert(JSON.stringify(r.data));
    }
  }

  return (
    <>
      <style>{`/* Insert your entire CSS exactly as in index.html (copied) */`}</style>

      <div className="container">
        <div className="left-panel">
          <div className="brand">
            <h1>AI Vision Platform</h1>
            <p>Advanced object detection and intelligent analysis powered by state-of-the-art machine learning models</p>
          </div>

          <div className="features">
            {/* feature items identical */}
            <div className="feature-item">
              <div className="feature-icon">
                <svg viewBox="0 0 24 24"><path d="M9 11l3 3L22 4"></path><path d="M21 12v7a2 2 0 01-2 2H5a2 2 0 01-2-2V5a2 2 0 012-2h11"></path></svg>
              </div>
              <div className="feature-content">
                <h3>YOLO Object Detection</h3>
                <p>Real-time object detection with industry-leading accuracy and performance metrics</p>
              </div>
            </div>
            {/* other features... */}
          </div>
        </div>

        <div className="right-panel">
          <div className="auth-header">
            <h2>{tab === 'login' ? 'Welcome Back' : 'Create Account'}</h2>
            <p>{tab === 'login' ? 'Enter your credentials to access your account' : 'Sign up to start analyzing images with AI'}</p>
          </div>

          <div className="tab-container">
            <button className={`tab ${tab==='login' ? 'active' : ''}`} onClick={() => setTab('login')}>Sign In</button>
            <button className={`tab ${tab==='signup' ? 'active' : ''}`} onClick={() => setTab('signup')}>Sign Up</button>
          </div>

          {tab === 'login' && (
            <form className="login-form active" onSubmit={handleLogin}>
              <div className="form-group">
                <label htmlFor="login-email">Email Address</label>
                <div className="input-wrapper">
                  <input value={loginEmail} onChange={e => setLoginEmail(e.target.value)} type="email" id="login-email" placeholder="you@example.com" required />
                </div>
              </div>

              <div className="form-group">
                <label htmlFor="login-password">Password</label>
                <div className="input-wrapper">
                  <input value={loginPassword} onChange={e => setLoginPassword(e.target.value)} type="password" id="login-password" placeholder="Enter your password" required />
                </div>
              </div>

              <div className="remember-forgot">
                <div className="checkbox-wrapper">
                  <input type="checkbox" id="remember" />
                  <label htmlFor="remember">Remember me</label>
                </div>
                <a className="forgot-link">Forgot Password?</a>
              </div>

              <button type="submit" className="submit-btn">Sign In</button>
            </form>
          )}

          {tab === 'signup' && (
            <form className="signup-form active" onSubmit={handleSignup}>
              <div className="form-group">
                <label htmlFor="signup-name">Full Name</label>
                <div className="input-wrapper">
                  <input value={signupName} onChange={e => setSignupName(e.target.value)} type="text" id="signup-name" placeholder="John Doe" required />
                </div>
              </div>

              <div className="form-group">
                <label htmlFor="signup-email">Email Address</label>
                <div className="input-wrapper">
                  <input value={signupEmail} onChange={e => setSignupEmail(e.target.value)} type="email" id="signup-email" placeholder="you@example.com" required />
                </div>
              </div>

              <div className="form-group">
                <label htmlFor="signup-password">Password</label>
                <div className="input-wrapper">
                  <input value={signupPassword} onChange={e => setSignupPassword(e.target.value)} type="password" id="signup-password" placeholder="Create a password" required />
                </div>
              </div>

              <div className="form-group">
                <label htmlFor="signup-confirm">Confirm Password</label>
                <div className="input-wrapper">
                  <input value={signupConfirm} onChange={e => setSignupConfirm(e.target.value)} type="password" id="signup-confirm" placeholder="Confirm your password" required />
                </div>
              </div>

              <button type="submit" className="submit-btn">Create Account</button>
            </form>
          )}
        </div>
      </div>
    </>
  );
}

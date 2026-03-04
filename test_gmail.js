const https = require('https');
const { URL } = require('url');

// Load from env
const CLIENT_ID = process.env.GMAIL_CLIENT_ID;
const CLIENT_SECRET = process.env.GMAIL_CLIENT_SECRET;
const REFRESH_TOKEN = process.env.GMAIL_REFRESH_TOKEN;

function httpRequest(url, options, body = null) {
  return new Promise((resolve, reject) => {
    const parsed = new URL(url);
    const req = https.request({
      hostname: parsed.hostname,
      port: 443,
      path: parsed.pathname + parsed.search,
      method: options.method || 'GET',
      headers: options.headers || {}
    }, (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => {
        try {
          resolve({ status: res.statusCode, body: JSON.parse(data) });
        } catch (e) {
          resolve({ status: res.statusCode, body: data });
        }
      });
    });
    req.on('error', reject);
    if (body) req.write(body);
    req.end();
  });
}

async function getAccessToken() {
  const body = `client_id=${encodeURIComponent(CLIENT_ID)}` +
               `&client_secret=${encodeURIComponent(CLIENT_SECRET)}` +
               `&refresh_token=${encodeURIComponent(REFRESH_TOKEN)}` +
               `&grant_type=refresh_token`;
  
  const result = await httpRequest('https://oauth2.googleapis.com/token', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
  }, body);
  
  if (result.body.access_token) {
    return result.body.access_token;
  }
  throw new Error('Failed to get access token: ' + JSON.stringify(result.body));
}

async function sendEmail(accessToken, to, subject, bodyText) {
  const email = [
    'Content-Type: text/plain; charset="UTF-8"',
    'MIME-Version: 1.0',
    'Content-Transfer-Encoding: 7bit',
    `To: ${to}`,
    `Subject: ${subject}`,
    '',
    bodyText
  ].join('\r\n');
  
  const encodedEmail = Buffer.from(email).toString('base64')
    .replace(/\+/g, '-')
    .replace(/\//g, '_')
    .replace(/=+$/, '');
  
  const result = await httpRequest('https://gmail.googleapis.com/gmail/v1/users/me/messages/send', {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${accessToken}`,
      'Content-Type': 'application/json'
    }
  }, JSON.stringify({ raw: encodedEmail }));
  
  return result;
}

async function main() {
  try {
    console.log('Getting access token...');
    const accessToken = await getAccessToken();
    console.log('✓ Got access token');
    
    console.log('Sending test email...');
    const result = await sendEmail(
      accessToken,
      'jayna.m.keed@gmail.com',
      'Gmail OAuth Test',
      'This is a test email to verify your Gmail OAuth setup is working!\n\n-Dottie'
    );
    
    if (result.body.id) {
      console.log('✓ Email sent! Message ID:', result.body.id);
    } else {
      console.error('Failed to send email:', result.body);
      process.exit(1);
    }
  } catch (err) {
    console.error('Error:', err.message);
    process.exit(1);
  }
}

main();

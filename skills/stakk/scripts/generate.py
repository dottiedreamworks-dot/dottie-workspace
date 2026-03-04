#!/usr/bin/env python3
"""
Stakk - Main generation engine for presentations and documents
"""
import sys
import json
import os
from pathlib import Path

def main():
    """Entry point for stakk generation"""
    # Read inputs from stdin (OpenClaw skill protocol)
    inputs = json.load(sys.stdin) if not sys.stdin.isatty() else {}
    
    content = inputs.get('content', '')
    format_type = inputs.get('format', 'html-slides')
    style = inputs.get('style', 'minimal')
    title = inputs.get('title', 'Untitled Presentation')
    
    # Determine output based on format
    if format_type == 'html-slides':
        output = generate_html_slides(content, style, title)
        extension = 'html'
    elif format_type == 'markdown-slides':
        output = generate_markdown_slides(content, style, title)
        extension = 'md'
    elif format_type == 'landing-page':
        output = generate_landing_page(content, style, title)
        extension = 'html'
    elif format_type == 'document':
        output = generate_document(content, style, title)
        extension = 'html'
    else:
        output = generate_html_slides(content, style, title)
        extension = 'html'
    
    # Output result
    result = {
        'file': {
            'content': output,
            'filename': f"{title.lower().replace(' ', '_')}.{extension}",
            'mimeType': 'text/html' if extension == 'html' else 'text/markdown'
        }
    }
    print(json.dumps(result))

def generate_html_slides(content, style, title):
    """Generate HTML slide deck"""
    # Parse content into slides (simple h1/h2 splitting)
    slides = parse_content_to_slides(content)
    
    # Get theme CSS
    theme_css = get_theme_css(style)
    
    # Build HTML
    html = f'''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{title}</title>
    <style>
{theme_css}
        .slide-container {{
            position: relative;
            width: 100%;
            min-height: 100vh;
        }}
        .slide {{
            width: 100%;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 4rem;
            box-sizing: border-box;
            page-break-after: always;
        }}
        .slide-content {{
            max-width: 1200px;
            width: 100%;
        }}
        .slide-nav {{
            position: fixed;
            bottom: 2rem;
            right: 2rem;
            display: flex;
            gap: 0.5rem;
            z-index: 100;
        }}
        .slide-nav button {{
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
        }}
        .slide-number {{
            position: fixed;
            bottom: 2rem;
            left: 2rem;
            opacity: 0.5;
            font-size: 0.875rem;
        }}
    </style>
</head>
<body>
    <div class="slide-container">
'''
    
    for i, slide in enumerate(slides, 1):
        html += f'''
        <div class="slide" id="slide-{i}">
            <div class="slide-content">
                {slide}
            </div>
        </div>
'''
    
    html += f'''
    </div>
    <div class="slide-number"><span id="current">1</span> / {len(slides)}</div>
    <div class="slide-nav">
        <button onclick="prevSlide()">← Prev</button>
        <button onclick="nextSlide()">Next →</button>
    </div>
    <script>
        let currentSlide = 1;
        const totalSlides = {len(slides)};
        
        function showSlide(n) {{
            if (n < 1) currentSlide = 1;
            else if (n > totalSlides) currentSlide = totalSlides;
            else currentSlide = n;
            
            document.getElementById('slide-' + currentSlide).scrollIntoView({{behavior: 'smooth'}});
            document.getElementById('current').textContent = currentSlide;
        }}
        
        function nextSlide() {{ showSlide(currentSlide + 1); }}
        function prevSlide() {{ showSlide(currentSlide - 1); }}
        
        document.addEventListener('keydown', (e) => {{
            if (e.key === 'ArrowRight' || e.key === ' ') nextSlide();
            if (e.key === 'ArrowLeft') prevSlide();
        }});
    </script>
</body>
</html>'''
    
    return html

def generate_markdown_slides(content, style, title):
    """Generate Markdown-based slides"""
    slides = parse_content_to_slides(content, markdown_output=True)
    md = f"# {title}\n\n---\n\n"
    md += "\n\n---\n\n".join(slides)
    return md

def generate_landing_page(content, style, title):
    """Generate a single-page landing page"""
    theme_css = get_theme_css(style)
    
    # Convert content to HTML
    content_html = markdown_to_html(content)
    
    html = f'''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{title}</title>
    <style>
{theme_css}
        body {{
            line-height: 1.6;
        }}
        .container {{
            max-width: 900px;
            margin: 0 auto;
            padding: 3rem 2rem;
        }}
        h1, h2, h3 {{
            margin-top: 2rem;
            margin-bottom: 1rem;
        }}
        p {{
            margin-bottom: 1rem;
        }}
        ul, ol {{
            margin-bottom: 1.5rem;
            padding-left: 2rem;
        }}
        blockquote {{
            border-left: 4px solid #ddd;
            padding-left: 1rem;
            margin: 1.5rem 0;
            font-style: italic;
        }}
    </style>
</head>
<body>
    <div class="container">
        <h1>{title}</h1>
        {content_html}
    </div>
</body>
</html>'''
    return html

def generate_document(content, style, title):
    """Generate a document layout"""
    # Similar to landing page but optimized for print
    return generate_landing_page(content, style, title)

def parse_content_to_slides(content, markdown_output=False):
    """Parse content into individual slides"""
    lines = content.split('\n')
    slides = []
    current_slide = []
    
    for line in lines:
        # New slide on h1 or h2
        if line.startswith('# ') or line.startswith('## '):
            if current_slide:
                slides.append('\n'.join(current_slide))
                current_slide = []
            if markdown_output:
                current_slide.append(line)
            else:
                # Convert to HTML
                text = line.lstrip('#').strip()
                level = 1 if line.startswith('# ') else 2
                current_slide.append(f'<h{level}>{text}</h{level}>')
        elif line.strip():
            if markdown_output:
                current_slide.append(line)
            else:
                # Convert markdown to HTML
                current_slide.append(markdown_to_html(line))
    
    if current_slide:
        slides.append('\n'.join(current_slide))
    
    # If no slides created, make everything one slide
    if not slides:
        if markdown_output:
            slides = [content]
        else:
            slides = [markdown_to_html(content)]
    
    return slides

def markdown_to_html(text):
    """Simple markdown to HTML converter"""
    import re
    
    # Bold
    text = re.sub(r'\*\*(.+?)\*\*', r'<strong>\1</strong>', text)
    # Italic
    text = re.sub(r'\*(.+?)\*', r'<em>\1</em>', text)
    # Headers (already handled in parse)
    text = re.sub(r'^### (.+)$', r'<h3>\1</h3>', text, flags=re.MULTILINE)
    # Lists
    text = re.sub(r'^- (.+)$', r'<li>\1</li>', text, flags=re.MULTILINE)
    # Paragraphs
    lines = text.split('\n')
    result = []
    in_list = False
    
    for line in lines:
        if line.startswith('<li>'):
            if not in_list:
                result.append('<ul>')
                in_list = True
            result.append(line)
        else:
            if in_list:
                result.append('</ul>')
                in_list = False
            if line.strip() and not line.startswith('<'):
                result.append(f'<p>{line}</p>')
            else:
                result.append(line)
    
    if in_list:
        result.append('</ul>')
    
    return '\n'.join(result)

def get_theme_css(style):
    """Get CSS for the specified theme"""
    themes = {
        'minimal': '''
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #ffffff;
            color: #1a1a1a;
            line-height: 1.5;
        }
        h1 { font-size: 3.5rem; font-weight: 700; margin-bottom: 1rem; }
        h2 { font-size: 2.5rem; font-weight: 600; margin-bottom: 0.75rem; }
        h3 { font-size: 1.75rem; font-weight: 600; }
        p { font-size: 1.25rem; color: #4a4a4a; margin-bottom: 1rem; }
        ul { font-size: 1.125rem; margin: 1rem 0; }
        li { margin: 0.5rem 0; }
        ''',
        'bold': '''
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Georgia', serif;
            background: #0a0a0a;
            color: #ffffff;
            line-height: 1.4;
        }
        .slide { background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%); }
        h1 { font-size: 4rem; font-weight: 800; margin-bottom: 1rem; color: #e94560; }
        h2 { font-size: 3rem; font-weight: 700; margin-bottom: 0.75rem; color: #e94560; }
        h3 { font-size: 2rem; font-weight: 600; }
        p { font-size: 1.5rem; color: #eaeaea; margin-bottom: 1rem; }
        ul { font-size: 1.25rem; margin: 1rem 0; }
        li { margin: 0.75rem 0; }
        button { background: #e94560; color: white; }
        ''',
        'elegant': '''
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Playfair Display', Georgia, serif;
            background: #faf9f6;
            color: #2c2c2c;
            line-height: 1.6;
        }
        h1 { font-size: 3rem; font-weight: 400; margin-bottom: 1rem; letter-spacing: -0.02em; }
        h2 { font-size: 2.25rem; font-weight: 400; margin-bottom: 0.75rem; color: #5a5a5a; }
        h3 { font-size: 1.5rem; font-weight: 600; }
        p { font-size: 1.125rem; color: #444; margin-bottom: 1rem; }
        ul { font-size: 1.0625rem; margin: 1rem 0; }
        li { margin: 0.5rem 0; }
        button { background: #2c2c2c; color: #faf9f6; }
        ''',
        'dark': '''
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #0d1117;
            color: #c9d1d9;
            line-height: 1.5;
        }
        .slide { background: #0d1117; }
        h1 { font-size: 3.5rem; font-weight: 700; margin-bottom: 1rem; color: #58a6ff; }
        h2 { font-size: 2.5rem; font-weight: 600; margin-bottom: 0.75rem; color: #79c0ff; }
        h3 { font-size: 1.75rem; font-weight: 600; color: #c9d1d9; }
        p { font-size: 1.25rem; color: #8b949e; margin-bottom: 1rem; }
        ul { font-size: 1.125rem; margin: 1rem 0; }
        li { margin: 0.5rem 0; }
        button { background: #238636; color: white; }
        ''',
        'light': '''
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #f6f8fa;
            color: #24292f;
            line-height: 1.5;
        }
        h1 { font-size: 3.5rem; font-weight: 700; margin-bottom: 1rem; color: #0969da; }
        h2 { font-size: 2.5rem; font-weight: 600; margin-bottom: 0.75rem; color: #1f6feb; }
        h3 { font-size: 1.75rem; font-weight: 600; }
        p { font-size: 1.25rem; color: #57606a; margin-bottom: 1rem; }
        ul { font-size: 1.125rem; margin: 1rem 0; }
        li { margin: 0.5rem 0; }
        button { background: #0969da; color: white; }
        ''',
        'playful': '''
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Nunito', -apple-system, sans-serif;
            background: #fff5f5;
            color: #2d3748;
            line-height: 1.6;
        }
        .slide { background: linear-gradient(135deg, #fff5f5 0%, #e6fffa 100%); }
        h1 { font-size: 3.5rem; font-weight: 800; margin-bottom: 1rem; color: #dd6b20; }
        h2 { font-size: 2.5rem; font-weight: 700; margin-bottom: 0.75rem; color: #319795; }
        h3 { font-size: 1.75rem; font-weight: 700; color: #2d3748; }
        p { font-size: 1.25rem; color: #4a5568; margin-bottom: 1rem; }
        ul { font-size: 1.125rem; margin: 1rem 0; }
        li { margin: 0.5rem 0; }
        button { background: #dd6b20; color: white; border-radius: 25px; }
        ''',
    }
    return themes.get(style, themes['minimal'])

if __name__ == '__main__':
    main()

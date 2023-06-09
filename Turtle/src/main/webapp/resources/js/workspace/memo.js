const memoDivs = document.querySelectorAll('.memoContent');

for (let i = 0; i < memoDivs.length; i++) {
  const div = memoDivs[i];
  const maxWidth = 200; // 최대 너비 설정 (200px로 가정)
  const maxHeight = 200; // 최대 높이 설정 (200px로 가정)

  div.addEventListener('input', function() {
    const contentWidth = this.scrollWidth;
    const contentHeight = this.scrollHeight;

    if (contentWidth > maxWidth) {
      const content = this.innerText;
      const truncatedContent = content.slice(0, -1);
      this.innerText = truncatedContent;
    }

    if (contentHeight > maxHeight) {
      this.innerText = '';
    }
  });
}
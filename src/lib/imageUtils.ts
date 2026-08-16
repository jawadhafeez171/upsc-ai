/**
 * Strict validator to check if a string is a genuine image file URL.
 * Protects against placeholder strings like 'None', 'null', 'No', 'N/A', etc.
 */
export function isValidImageUrl(url?: string | null): boolean {
  if (!url || typeof url !== 'string') return false;
  const trimmed = url.trim();
  if (!trimmed) return false;

  const lower = trimmed.toLowerCase();
  if (
    lower === 'none' ||
    lower === 'no' ||
    lower === 'null' ||
    lower === 'undefined' ||
    lower === 'false' ||
    lower === 'n/a' ||
    lower === 'na' ||
    lower === 'nil' ||
    lower === '0'
  ) {
    return false;
  }

  // Must be a valid absolute HTTP(S) URL, relative root path, or base64 data URI
  const isHttp = lower.startsWith('http://') || lower.startsWith('https://');
  const isLocal = lower.startsWith('/');
  const isDataUri = lower.startsWith('data:image/');

  return isHttp || isLocal || isDataUri;
}

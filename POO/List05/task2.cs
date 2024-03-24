using System;
using System.IO;

namespace List05
{
    class CaesarStream : Stream
    {
        private readonly Stream _baseStream;
        private readonly int _shift;

        public CaesarStream(Stream baseStream, int shift)
        {
            _baseStream = baseStream ?? throw new ArgumentNullException(nameof(baseStream));
            _shift = shift;
        }

        public override bool CanRead => _baseStream.CanRead;
        public override bool CanSeek => _baseStream.CanSeek;
        public override bool CanWrite => _baseStream.CanWrite;
        public override long Length => _baseStream.Length;

        public override long Position
        {
            get => _baseStream.Position;
            set => _baseStream.Position = value;
        }

        public override void Flush()
        {
            _baseStream.Flush();
        }

        public override int Read(byte[] buffer, int offset, int count)
        {
            int bytesRead = _baseStream.Read(buffer, offset, count);
            for (int i = 0; i < bytesRead; i++)
            {
                buffer[offset + i] = (byte)(buffer[offset + i] + _shift);
            }
            return bytesRead;
        }

        public override long Seek(long offset, SeekOrigin origin)
        {
            return _baseStream.Seek(offset, origin);
        }

        public override void SetLength(long value)
        {
            _baseStream.SetLength(value);
        }

        public override void Write(byte[] buffer, int offset, int count)
        {
            byte[] encryptedBuffer = new byte[count];
            for (int i = 0; i < count; i++)
            {
                encryptedBuffer[i] = (byte)(buffer[offset + i] - _shift);
            }
            _baseStream.Write(encryptedBuffer, 0, count);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                _baseStream.Dispose();
            }
            base.Dispose(disposing);
        }
    }

    class Program
    {
        static void Main2(string[] args)
        {
            using (FileStream fileToWrite = File.Create("encrypted.txt"))
            {
                using (CaesarStream caeToWrite = new CaesarStream(fileToWrite, 5))
                {
                    byte[] dataToWrite = { 72, 101, 108, 108, 111, 32, 87, 111, 114, 108, 100 }; // "Hello World" in ASCII
                    caeToWrite.Write(dataToWrite, 0, dataToWrite.Length);
                }
            }

            using (FileStream fileToRead = File.Open("encrypted.txt", FileMode.Open))
            {
                using (CaesarStream caeToRead = new CaesarStream(fileToRead, -5))
                {
                    byte[] dataRead = new byte[fileToRead.Length];
                    caeToRead.Read(dataRead, 0, dataRead.Length);
                    string decryptedText = System.Text.Encoding.ASCII.GetString(dataRead);
                    Console.WriteLine("Decrypted text: " + decryptedText);
                }
            }
        }
    }
}
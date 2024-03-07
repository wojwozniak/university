import React from 'react';
import Introduction from './components/Introduction';
import AboutMe from './components/AboutMe';
import Skills from './components/Skills';

const App: React.FC = () => {
  return (
    <div className="app">
      <Introduction
        photoUrl="https://avatars.githubusercontent.com/u/83915178?v=4"
        firstName="Wojciech"
        lastName="Woźniak"
        companyName="UWr"
      />
      <AboutMe bio="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce rutrum condimentum nisl quis lobortis. Praesent egestas pretium efficitur. Nam fringilla nec risus in mollis. Suspendisse vitae feugiat nisl, a mattis nulla. Suspendisse potenti. Curabitur et augue vel nunc pellentesque ullamcorper vitae sit amet orci. Aliquam vel tempus nisi, tempor suscipit metus." />
      <Skills skills={['JavaScript', 'React', 'TypeScript', 'HTML', 'CSS']} />
    </div>
  );
}

export default App;
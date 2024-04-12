import * as Tabs from '@radix-ui/react-tabs';
import Account from './sections/Account';
import Password from './sections/Password';
import Preferences from './sections/Preferences';

const Main = () => {
  const capitalize = (str: string) => {
    return str.charAt(0).toUpperCase() + str.slice(1);
  };

  const content = [
    { id: 'account', content: <Account /> },
    { id: 'password', content: <Password /> },
    { id: 'preferences', content: <Preferences /> }
  ];

  return (
    <div className="w-3/5 h-3/5 flex flex-row justify-between items-center mx-auto">
      <Tabs.Root defaultValue="account"
        orientation="horizontal"
        aria-label="Vertical Tabs"
        className="w-full h-full flex flex-row">
        <Tabs.List aria-label="Menu" className="flex flex-col w-[11%] py-2 h-full bg-gray-300 rounded-l-lg">
          {content.map((tab) => (
            <Tabs.Trigger key={tab.id} value={tab.id} aria-label={`${tab.id} Tab`} className="cursor-pointer">
              <p className='tab-title text-lg px-2'>{capitalize(tab.id)}</p>
            </Tabs.Trigger>
          ))}
        </Tabs.List>
        {content.map((item) =>
          <Tabs.Content key={item.id} value={item.id} className="w-4/5 h-full p-2 bg-[#f6f6f6] rounded-r-lg">
            {item.content}
          </Tabs.Content>
        )}
      </Tabs.Root>
    </div>
  );
}

export default Main;
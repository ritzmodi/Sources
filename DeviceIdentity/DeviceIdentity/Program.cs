using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Azure.Devices;
using Microsoft.Azure.Devices.Common.Exceptions;


namespace DeviceIdentity
{
    class Program
    {
        static RegistryManager registryManager;
        static string connectionString = "HostName=mclass.azure-devices.net;SharedAccessKeyName=iothubowner;SharedAccessKey=unxYBC2AeqKjWYW5OwtY1jFeSAp/4S339yVZOQX5n5A=";
       
        

        static void Main(string[] args)
        {
            registryManager = RegistryManager.CreateFromConnectionString(connectionString);
            AddDeviceAsync().Wait();
            Console.ReadLine();

        }

        private static async Task AddDeviceAsync() {
            string deviceID = "mydeviceid1";
            Device device;
            try
            {
                device = await registryManager.AddDeviceAsync(new Device(deviceID));
            }
            catch (DeviceAlreadyExistsException ex)
            {
                device = await registryManager.GetDeviceAsync(deviceID);
            }
            Console.WriteLine("Generated device key: {0}", device.Authentication.SymmetricKey.PrimaryKey);

        }
    }
}

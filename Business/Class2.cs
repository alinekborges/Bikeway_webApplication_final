using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    class Class2
    {
        private long _UserId;

        public long UserId
        {
            get
            {
                return this._UserId;
            }
            set
            {
                this._UserId = value;
            }
        }
    }
}

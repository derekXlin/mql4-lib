//+------------------------------------------------------------------+
//| Module: Utils/Time.mqh                                           |
//| This file is part of the mql4-lib project:                       |
//|     https://github.com/dingmaotu/mql4-lib                        |
//|                                                                  |
//| Copyright 2017 Li Ding <dingmaotu@126.com>                       |
//|                                                                  |
//| Licensed under the Apache License, Version 2.0 (the "License");  |
//| you may not use this file except in compliance with the License. |
//| You may obtain a copy of the License at                          |
//|                                                                  |
//|     http://www.apache.org/licenses/LICENSE-2.0                   |
//|                                                                  |
//| Unless required by applicable law or agreed to in writing,       |
//| software distributed under the License is distributed on an      |
//| "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,     |
//| either express or implied.                                       |
//| See the License for the specific language governing permissions  |
//| and limitations under the License.                               |
//+------------------------------------------------------------------+
#property strict
//+------------------------------------------------------------------+
//| Time in seconds and corresponding unit name                      |
//+------------------------------------------------------------------+
struct TimeFormat
  {
   long              TimeInSeconds;
   string            TimeUnit;
  };
TimeFormat DefaultTimeFormats[]={{3600*24,"天"},{3600,"小时"},{60,"分"},{1,"秒"}};
//+------------------------------------------------------------------+
//| Format a time range in seconds as human friendly time expression |
//| `formats` is like:                                               |
//|   {{3600*24,"天"},{3600,"小时"},{60,"分"},{1,"秒"}};             |
//+------------------------------------------------------------------+
string FormatTimeRange(long seconds,const TimeFormat &formats[])
  {
   int formatSize=ArraySize(formats);
   long rem=0,mod=seconds;
   string result="";
   int i=0;
   do
     {
      rem = mod/formats[i].TimeInSeconds;
      mod = mod%formats[i].TimeInSeconds;
      if(rem>0)
        {
         result+=StringFormat("%ld"+formats[i].TimeUnit,rem);
        }
      i++;
     }
   while(mod>0 && i<formatSize);

   return result;
  }
//+------------------------------------------------------------------+
//| With default parameter timeFormats set to DefaultTimeFormats     |
//+------------------------------------------------------------------+
string FormatDefaultTimeRange(long seconds)
  {
   return FormatTimeRange(seconds,DefaultTimeFormats);
  }
//+------------------------------------------------------------------+

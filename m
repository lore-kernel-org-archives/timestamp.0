Received: from muru.com (muru.com [72.249.23.125])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2981FC8DB
	for <timestamp@lists.linux.dev>; Mon, 11 Sep 2023 12:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 6F29580A2;
	Mon, 11 Sep 2023 12:50:47 +0000 (UTC)
Date: Mon, 11 Sep 2023 15:50:46 +0300
From: Tony Lindgren <tony@atomide.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Russell King <linux@armlinux.org.uk>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dipen Patel <dipenp@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
	linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [RFT PATCH 15/21] arm: omap1: ams-delta: stop using
 gpiochip_find()
Message-ID: <20230911125046.GA5285@atomide.com>
References: <20230905185309.131295-1-brgl@bgdev.pl>
 <20230905185309.131295-16-brgl@bgdev.pl>
 <CACRpkdaVUPNYVjAi2XsNKVhwmtk2qpVp62Lke4xeDOwhhBXLtg@mail.gmail.com>
 <6555932.G0QQBjFxQf@dell>
 <CAMRc=Mfrk9q6fJyEAuxDXYPpbjVHeLJaTjHEcKiYHzrE3r+_7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mfrk9q6fJyEAuxDXYPpbjVHeLJaTjHEcKiYHzrE3r+_7A@mail.gmail.com>

* Bartosz Golaszewski <brgl@bgdev.pl> [230911 11:10]:
> On Fri, Sep 8, 2023 at 8:07 PM Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:
> >
> > Dnia czwartek, 7 września 2023 09:31:01 CEST Linus Walleij pisze:
> > > On Tue, Sep 5, 2023 at 8:53 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > gpiochip_find() is going away as it's not hot-unplug safe. This platform
> > > > is not affected by any of the related problems as this GPIO controller
> > > > cannot really go away but in order to finally remove this function, we
> > > > need to convert it to using gpio_device_find() as well.
> > > >
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > I was cleaning this one just some merge cycle ago, now it
> > > looks even better!
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Acked-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> >
> 
> Janusz,
> 
> Is it fine if I take it through the GPIO tree?

Works for me at least:

Acked-by: Tony Lindgren <tony@atomide.com>

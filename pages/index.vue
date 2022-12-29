<template>
    <div class="p-4">
    <section class="bg-white">
            <div class="gap-16 items-center py-20 px-4 mx-auto max-w-screen-xl">
                <div class="sm:text-lg">
                    <h1 class="mb-6 text-gray-900 text-3xl font-extrabold text-center">Your Dockerized Nuxt App is running as SSR </h1>
                    <p class="mb-4 font-normal"> 
                        This app is dockerized using Dockerfile. To run, build the docker image and run the image.
                    </p>
                    

                </div>
            </div>
        </section>
        
        </div>
  </template>
  
  <style lang="postcss" scoped>
  .badge {
    @apply inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700;
    &:hover {
      @apply bg-gray-300;
    }
  }
  </style>